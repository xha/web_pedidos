<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoSeniat
 * 
 * @property int $idTipoSeniat
 * @property string $descripcion
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
class TipoSeniat extends Model
{
	protected $table = 'tipo_seniat';
	protected $primaryKey = 'idTipoSeniat';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function persona_clientes()
	{
		return $this->hasMany(PersonaCliente::class, 'idTipoSeniat');
	}

	public function persona_proveedors()
	{
		return $this->hasMany(PersonaProveedor::class, 'idTipoSeniat');
	}
}
