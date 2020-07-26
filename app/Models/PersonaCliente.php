<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PersonaCliente
 * 
 * @property int $idPersonaCliente
 * @property int $idPersona
 * @property string|null $representante
 * @property int|null $idAlterno
 * @property string|null $codiZip
 * @property int $idTipoSeniat
 * @property bool $esCredito
 * @property float $limiteCredito
 * @property bool $esTolerancia
 * @property int $diasTolerancia
 * @property bool $esDescuento
 * @property bool $esPorcentaje
 * @property float $descuento
 * @property bool $esAgenteRetencion
 * @property int|null $idTipoRetencion
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Persona $persona
 * @property TipoSeniat $tipo_seniat
 * @property TipoRetencion $tipo_retencion
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class PersonaCliente extends Model
{
	protected $table = 'persona_cliente';
	protected $primaryKey = 'idPersonaCliente';
	public $timestamps = false;

	protected $casts = [
		'idPersona' => 'int',
		'idAlterno' => 'int',
		'idTipoSeniat' => 'int',
		'esCredito' => 'bool',
		'limiteCredito' => 'float',
		'esTolerancia' => 'bool',
		'diasTolerancia' => 'int',
		'esDescuento' => 'bool',
		'esPorcentaje' => 'bool',
		'descuento' => 'float',
		'esAgenteRetencion' => 'bool',
		'idTipoRetencion' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idPersona',
		'representante',
		'idAlterno',
		'codiZip',
		'idTipoSeniat',
		'esCredito',
		'limiteCredito',
		'esTolerancia',
		'diasTolerancia',
		'esDescuento',
		'esPorcentaje',
		'descuento',
		'esAgenteRetencion',
		'idTipoRetencion',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function persona()
	{
		return $this->belongsTo(Persona::class, 'idPersona');
	}

	public function tipo_seniat()
	{
		return $this->belongsTo(TipoSeniat::class, 'idTipoSeniat');
	}

	public function tipo_retencion()
	{
		return $this->belongsTo(TipoRetencion::class, 'idTipoRetencion');
	}

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idPersonaCliente');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idPersonaCliente');
	}
}
