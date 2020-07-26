<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CuentasPorCobrar
 * 
 * @property int $idCxc
 * @property int $idUsuario
 * @property int $idMoneda
 * @property int $idTipoTransaccion
 * @property int $idUbicacion
 * @property int $idEstatusTransaccion
 * @property int $idPersonaCliente
 * @property string $descripcionCliente
 * @property float $documentoRelacionado
 * @property float $montoItem
 * @property float $montoImpuesto
 * @property float $gravable
 * @property float $exento
 * @property float $descuento
 * @property float $montoRetencion
 * @property float $montoTotal
 * @property string|null $observacion
 * @property Carbon $fechaOperacion
 * @property string $ruta
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Moneda $moneda
 * @property Ubicacion $ubicacion
 * @property Usuario $usuario
 * @property EstatusTransaccion $estatus_transaccion
 * @property PersonaCliente $persona_cliente
 * @property TipoTransaccion $tipo_transaccion
 *
 * @package App\Models
 */
class CuentasPorCobrar extends Model
{
	protected $table = 'cuentas_por_cobrar';
	protected $primaryKey = 'idCxc';
	public $timestamps = false;

	protected $casts = [
		'idUsuario' => 'int',
		'idMoneda' => 'int',
		'idTipoTransaccion' => 'int',
		'idUbicacion' => 'int',
		'idEstatusTransaccion' => 'int',
		'idPersonaCliente' => 'int',
		'documentoRelacionado' => 'float',
		'montoItem' => 'float',
		'montoImpuesto' => 'float',
		'gravable' => 'float',
		'exento' => 'float',
		'descuento' => 'float',
		'montoRetencion' => 'float',
		'montoTotal' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaOperacion',
		'fechaCreacion'
	];

	protected $fillable = [
		'idUsuario',
		'idMoneda',
		'idTipoTransaccion',
		'idUbicacion',
		'idEstatusTransaccion',
		'idPersonaCliente',
		'descripcionCliente',
		'documentoRelacionado',
		'montoItem',
		'montoImpuesto',
		'gravable',
		'exento',
		'descuento',
		'montoRetencion',
		'montoTotal',
		'observacion',
		'fechaOperacion',
		'ruta',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function moneda()
	{
		return $this->belongsTo(Moneda::class, 'idMoneda');
	}

	public function ubicacion()
	{
		return $this->belongsTo(Ubicacion::class, 'idUbicacion');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'idUsuario');
	}

	public function estatus_transaccion()
	{
		return $this->belongsTo(EstatusTransaccion::class, 'idEstatusTransaccion');
	}

	public function persona_cliente()
	{
		return $this->belongsTo(PersonaCliente::class, 'idPersonaCliente');
	}

	public function tipo_transaccion()
	{
		return $this->belongsTo(TipoTransaccion::class, 'idTipoTransaccion');
	}
}
