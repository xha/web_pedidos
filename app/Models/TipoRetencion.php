<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoRetencion
 * 
 * @property int $idTipoRetencion
 * @property string $descripcion
 * @property bool|null $aProveedor
 * @property bool|null $aCliente
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|PersonaCliente[] $persona_clientes
 * @property Collection|PersonaProveedor[] $persona_proveedors
 *
 * @package App\Models
 */
class TipoRetencion extends Model
{
	protected $table = 'tipo_retencion';
	protected $primaryKey = 'idTipoRetencion';
	public $timestamps = false;

	protected $casts = [
		'aProveedor' => 'bool',
		'aCliente' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'aProveedor',
		'aCliente',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function persona_clientes()
	{
		return $this->hasMany(PersonaCliente::class, 'idTipoRetencion');
	}

	public function persona_proveedors()
	{
		return $this->hasMany(PersonaProveedor::class, 'idTipoRetencion');
	}
}
